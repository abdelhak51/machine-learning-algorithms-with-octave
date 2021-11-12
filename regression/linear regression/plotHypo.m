function plotHypo(y_rest_reel,y_rest_predict)
  figure ('name','hypothese function');
  plot(y_rest_reel,'Displayname','Y_predict'); % plot les y reel par des ligne rouge
  title('prediction des valeurs');
  hold on;
  plot(y_rest_predict,'Displayname','Y_reel'); % plot les y predit par des ligne bleu
  legend('Y reel','Y predict');
  hold off;
  end