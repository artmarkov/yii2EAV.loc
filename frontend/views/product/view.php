<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Product */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Products', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
//echo '<pre>' . print_r($model, true) . '</pre>';
//echo '<pre>' . print_r($model->getEavAttributes()->all(), true) . '</pre>';
?>
<div class="product-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'product_name',
            'visible',
            'c1',
            'c80',
        ],
    ]) ?>
    <table class="table">
        <?php
        foreach ($model->getEavAttributes()->all() as $attr) {
            ?>
            <tr>
                <td><?= $attr->type; ?></td>
                <td>
                    <ul>
                        <?php
                        $attrValue = $model->renderEavAttr($attr, $model);
                        if ($attrValue[0]['value']) {
                            foreach ($attrValue as $attrValueItem) {
                                echo '<li>';
                                echo $attrValueItem['value'];
                                echo '</li>';
                            }
                        } else echo '---';
                        ?>
                    </ul>
                </td>
            </tr>
        <?php
        }
        ?>
    </table>
</div>
