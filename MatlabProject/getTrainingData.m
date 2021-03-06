function [ X, Y, X_ALL ] = getTrainingData(index,daily_ret, vol_10, vol_20, cum_ret_1,...
    cum_ret_4, cum_ret_13, cum_ret_52, MA_20, MA_50, EMA_20, EMA_50, mom_ind,...
    corr_mat_sp500, surprises_ind)

indicators_num = size(surprises_ind,1)
% Get all data into same window
% SP500 as example

target_rets = daily_ret(end-indicators_num+1:end,index);

Y = arrayfun(@(x) convertToClass(x), target_rets);

X = [...
    daily_ret(end-indicators_num:end-1,index) ...
    vol_10(end-indicators_num:end-1,index) ...
    vol_20(end-indicators_num:end-1,index) ...
    cum_ret_1(end-indicators_num:end-1,index) ...
    cum_ret_4(end-indicators_num:end-1,index) ... 
    cum_ret_13(end-indicators_num:end-1,index) ... 
    cum_ret_52(end-indicators_num:end-1,index) ... 
    MA_20(end-indicators_num:end-1,index) ... 
    MA_50(end-indicators_num:end-1,index) ... 
    EMA_20(end-indicators_num:end-1,index) ...
    EMA_50(end-indicators_num:end-1,index) ...
    mom_ind(end-indicators_num:end-1,index) ...
    corr_mat_sp500(end-indicators_num:end-1,2:11) ... 
    surprises_ind ... 
    ];

X_ALL = [...
    daily_ret(end-indicators_num:end-1,:) ...
    vol_10(end-indicators_num:end-1,:) ...
    vol_20(end-indicators_num:end-1,:) ...
    cum_ret_1(end-indicators_num:end-1,:) ...
    cum_ret_4(end-indicators_num:end-1,:) ... 
    cum_ret_13(end-indicators_num:end-1,:) ... 
    cum_ret_52(end-indicators_num:end-1,:) ... 
    MA_20(end-indicators_num:end-1,:) ... 
    MA_50(end-indicators_num:end-1,:) ... 
    EMA_20(end-indicators_num:end-1,:) ...
    EMA_50(end-indicators_num:end-1,:) ...
    mom_ind(end-indicators_num:end-1,:) ...
    corr_mat_sp500(end-indicators_num:end-1,2:end) ... 
    surprises_ind ... 
    ];


end

