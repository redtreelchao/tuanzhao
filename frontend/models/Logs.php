<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_logs".
 *
 * @property integer $id
 * @property string $name
 * @property string $detail
 * @property integer $user_id
 * @property integer $add_time
 */
class Logs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_logs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'user_id'], 'required'],
            [['detail'], 'string'],
            [['user_id', 'add_time'], 'integer'],
            [['name'], 'string', 'max' => 12]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'detail' => 'Detail',
            'user_id' => 'User ID',
            'add_time' => 'Add Time',
        ];
    }
}
