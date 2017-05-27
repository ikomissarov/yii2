<?php

namespace app\controllers;

use Yii;
use yii\rest\ActiveController;

class StudentRestController extends ActiveController
{
    public $modelClass = 'app\models\Student';
}