package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.GoodsDetailsActivity
import com.ds.worldfunclub.viewmodel.GoodsDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/9 15:23
 */

@Module
class GoodsDetailsModule(private val activity: GoodsDetailsActivity) {

    @ActivityScope
    @Provides
    fun provideGoodsDetailsModel(app: App, api: Api): GoodsDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(GoodsDetailsModel::class.java)

    }
}