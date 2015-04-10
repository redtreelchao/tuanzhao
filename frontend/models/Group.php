<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_group".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $name
 * @property string $desc
 * @property integer $add_time
 * @property integer $user_num
 *
 * @property GroupUsers[] $groupUsers
 */
class Group extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_group';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'name', 'desc'], 'required'],
            [['user_id', 'add_time', 'user_num'], 'integer'],
            [['desc'], 'string'],
            [['name'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'name' => 'Name',
            'desc' => 'Desc',
            'add_time' => 'Add Time',
            'user_num' => 'User Num',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGroupUsers()
    {
        return $this->hasMany(GroupUsers::className(), ['group_id' => 'id']);
    }
}
