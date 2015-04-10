<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_industry".
 *
 * @property integer $id
 * @property string $name
 * @property integer $parent_id
 * @property integer $add_time
 *
 * @property EntityIndustry[] $entityIndustries
 */
class Industry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_industry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'add_time'], 'required'],
            [['parent_id', 'add_time'], 'integer'],
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
            'name' => 'Name',
            'parent_id' => 'Parent ID',
            'add_time' => 'Add Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEntityIndustries()
    {
        return $this->hasMany(EntityIndustry::className(), ['industry_id' => 'id']);
    }
}
