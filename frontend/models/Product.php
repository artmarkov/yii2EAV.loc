<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property string $product_name
 * @property int $visible
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }
    /**
     * create_time, update_time to now()
     * crate_user_id, update_user_id to current login user id
     */
    public function behaviors()
    {
        return [
            'eav' => [
                'class' => \mirocow\eav\EavBehavior::className(),
                // это модель для таблицы object_attribute_value
                'valueClass' => \mirocow\eav\models\EavAttributeValue::className(),
            ]
        ];
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEavAttributes()
    {
        return \mirocow\eav\models\EavAttribute::find()
            ->joinWith('entity')
            ->where([
                //'categoryId' => $this->categories[0]->id,
                'entityModel' => $this::className()
            ]);
    }
    /**
     * @param $attr
     * @param null $model
     * @return array
     *
     * Создает массив с EAV атрибутами
     */
    function renderEavAttr($attr, $model = NULL)
    {
        $optionValues = $model[$attr->name]->value; // Список выбранных значений
        $allOptionValues = $attr->getEavOptions()->asArray()->all(); // Список всех возможных значений

        // Если массив - все возможные значения
        unset($out);
        if (is_array($allOptionValues)) {
            $out = [];
            foreach ($allOptionValues as $allOtionValuesItem) {
                // Если список доступных значений - массив
                if (is_array($optionValues)) {
                    foreach ($optionValues as $optionValuesItem) {
                        if ($optionValuesItem == $allOtionValuesItem["id"]) {
                            $out[] = $allOtionValuesItem;
                        }
                    }
                } else {
                    if ($optionValues == $allOtionValuesItem["id"]) {
                        $out[] = $allOtionValuesItem;
                    }
                }
            }


        }

        if ($out) {
            return $out;
        } else return [0 => [
            'id' => 0,
            'attributeId' => 0,
            'value' => $model[$attr->name]['value'],
            'defaultOptionId' => 0,
            'order' => 0,

        ]];
    }
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_name', 'visible'], 'required'],
            [['visible'], 'integer'],
            [['product_name'], 'string', 'max' => 254],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'product_name' => 'Product Name',
            'visible' => 'Visible',
        ];
    }
}
