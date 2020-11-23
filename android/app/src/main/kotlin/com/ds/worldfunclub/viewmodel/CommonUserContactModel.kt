package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.commonUserContactAdd
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:18
 */
@ActivityScope
class CommonUserContactModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    fun addContact(){
        ARouter.getInstance().build(commonUserContactAdd).navigation()
    }
}

