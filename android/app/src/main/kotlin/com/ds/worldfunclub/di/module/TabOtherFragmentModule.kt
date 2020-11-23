package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.ui.fragment.hometab.TabOtherFragment
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.TabOtherFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/8 9:18
 */

@Module
class TabOtherFragmentModule(private val activity: TabOtherFragment) {

    @FragmentScope
    @Provides
    fun provideTabOtherFragmentModel(app: App, api: Api): TabOtherFragmentModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory3(activity, app, api)
        ).get(TabOtherFragmentModel::class.java)

    }
}