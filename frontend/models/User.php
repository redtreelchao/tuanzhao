<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_user".
 *
 * @property integer $id
 * @property string $username
 * @property string $fullname
 * @property integer $add_time
 * @property string $reg_ip
 * @property string $id_num
 * @property integer $money
 * @property string $email
 * @property integer $mobile
 * @property string $qq
 *
 * @property CompanyUser[] $companyUsers
 * @property GroupUsers[] $groupUsers
 * @property UserStats[] $userStats
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username'], 'required'],
            [['add_time', 'money', 'mobile'], 'integer'],
            [['username'], 'string', 'max' => 32],
            [['fullname'], 'string', 'max' => 20],
            [['reg_ip'], 'string', 'max' => 15],
            [['id_num'], 'string', 'max' => 40],
            [['email', 'qq'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => '用户名',
            'fullname' => '真实姓名',
            'add_time' => '注册时间',
            'reg_ip' => '注册IP',
            'id_num' => '身份证号',
            'money' => '钱',
            'email' => '邮箱',
            'mobile' => '手机号',
            'qq' => 'QQ号',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyUsers()
    {
        return $this->hasMany(CompanyUser::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGroupUsers()
    {
        return $this->hasMany(GroupUsers::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserStats()
    {
        return $this->hasMany(UserStats::className(), ['user_id' => 'id']);
    }
}
