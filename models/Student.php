<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "student".
 *
 * @property string $FirstName
 * @property string $LastName
 * @property string $BirthDate
 * @property string $Gruppa
 * @property integer $ID
 */
class Student extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'student';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['FirstName', 'LastName', 'BirthDate', 'Gruppa'], 'required'],
            [['BirthDate'], 'safe'],
            [['FirstName', 'LastName', 'Gruppa'], 'string', 'max' => 64],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'FirstName' => 'First Name',
            'LastName' => 'Last Name',
            'BirthDate' => 'Birth Date',
            'Gruppa' => 'Gruppa',
            'ID' => 'ID',
        ];
    }
}
