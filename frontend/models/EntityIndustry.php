<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_entity_industry".
 *
 * @property integer $id
 * @property string $entity_key
 * @property integer $industry_id
 * @property integer $add_time
 * @property integer $entity_refer_id
 *
 * @property Industry $industry
 */
class EntityIndustry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_entity_industry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['entity_key', 'industry_id'], 'required'],
            [['industry_id', 'add_time', 'entity_refer_id'], 'integer'],
            [['entity_key'], 'string', 'max' => 10]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'entity_key' => 'Entity Key',
            'industry_id' => 'Industry ID',
            'add_time' => 'Add Time',
            'entity_refer_id' => '用户ID、公司ID、...',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIndustry()
    {
        return $this->hasOne(Industry::className(), ['id' => 'industry_id']);
    }
}
