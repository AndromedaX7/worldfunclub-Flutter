package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.ui.fragment.home.ClubFragment
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.ClubFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/6 15:19
 */

@Module
class ClubFragmentModule(private val fragment: ClubFragment) {

    @FragmentScope
    @Provides
    fun provideMainFragmentModel(app: App, api: Api): ClubFragmentModel {
        return ViewModelProvider(
            fragment,
            ViewModelFactory3(fragment, app, api)
        ).get(ClubFragmentModel::class.java)

    }
}