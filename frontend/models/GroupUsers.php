<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_group_users".
 *
 * @property integer $id
 * @property integer $group_id
 * @property integer $user_id
 * @property integer $add_time
 * @property integer $job_id
 *
 * @property User $user
 * @property Group $group
 */
class GroupUsers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_group_users';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['group_id', 'user_id', 'add_time', 'job_id'], 'required'],
            [['group_id', 'user_id', 'add_time', 'job_id'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'group_id' => 'Group ID',
            'user_id' => 'User ID',
            'add_time' => 'Add Time',
            'job_id' => 'Job ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGroup()
    {
        return $this->hasOne(Group::className(), ['id' => 'group_id']);
    }
}
