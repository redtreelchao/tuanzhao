<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_company".
 *
 * @property integer $id
 * @property string $name
 * @property integer $user_num
 * @property string $desc
 * @property string $logo
 * @property integer $add_time
 *
 * @property CompanyUser[] $companyUsers
 */
class Company extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_company';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'desc', 'add_time'], 'required'],
            [['user_num', 'add_time'], 'integer'],
            [['desc'], 'string'],
            [['name', 'logo'], 'string', 'max' => 128]
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
            'user_num' => 'User Num',
            'desc' => 'Desc',
            'logo' => 'logo',
            'add_time' => 'Add Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyUsers()
    {
        return $this->hasMany(CompanyUser::className(), ['company_id' => 'id']);
    }
}
