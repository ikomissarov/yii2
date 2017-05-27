$(document).ready(function () {

    $(document).ajaxError(function (event, xhr, settings) {
        console.error(settings.url, ":", xhr);
    });

    var StudentModel = function (firstName, lastName, birthdate, group) {
        this.firstName = ko.observable(firstName);
        this.lastName = ko.observable(lastName);
        this.birthdate = ko.observable(birthdate);
        this.group = ko.observable(group);

        this.fullName = ko.pureComputed(function () {
            return this.firstName() + " " + this.lastName();
        }, this);

        this.toJSON = function () {
            return JSON.stringify({
                FirstName: this.firstName(),
                LastName: this.lastName(),
                BirthDate: this.birthdate(),
                Gruppa: this.group()
            });
        };
    };

    var StudentListModel = function (students) {
        var self = this;
        self.students = ko.observableArray(students);
        self.selectedStudent = ko.observable(new StudentModel());

        self.add = function () {
            $.ajax({
                url: "index.php/students",
                type: "POST",
                data: self.selectedStudent().toJSON(),
                dataType: "json",
                contentType: "application/json;charset=utf-8"
            })
                .done(function (json) {
                    self.selectedStudent().id = json.ID;
                    self.students.push(self.selectedStudent());
                    self.clear();
                });
        };

        self.update = function () {
            $.ajax({
                url: "index.php/students/" + self.selectedStudent().id,
                type: "PUT",
                data: self.selectedStudent().toJSON(),
                dataType: "json",
                contentType: "application/json;charset=utf-8"
            })
                .done(function () {
                    self.clear();
                });
        };

        self.remove = function () {
            $.ajax({
                url: "index.php/students/" + self.selectedStudent().id,
                type: "DELETE"
            })
                .done(function () {
                    self.students.remove(self.selectedStudent());
                    self.clear();
                });
        };

        self.clear = function () {
            self.selectedStudent(new StudentModel());
        };

        self.select = function (selectedStudent) {
            if (self.selectedStudent() === selectedStudent) {
                self.clear();
            } else {
                self.selectedStudent(selectedStudent);
            }
        };

        self.refresh = function () {
            $.getJSON('index.php/students')
                .done(function (data) {
                    self.clear();
                    self.students.removeAll();
                    data.forEach(function (json) {
                        var studentModel = new StudentModel(json.FirstName, json.LastName, json.BirthDate, json.Gruppa);
                        studentModel.id = json.ID;
                        self.students.push(studentModel);
                    });
                });
        };

        self.notInList = function () {
            return self.students.indexOf(self.selectedStudent()) === -1;
        };

        self.notEmpty = function () {
            var student = self.selectedStudent();
            return student.firstName() && student.lastName() && student.birthdate() && student.group();
        };
    };

    var studentListModel = new StudentListModel();
    ko.applyBindings(studentListModel);
    studentListModel.refresh();
});