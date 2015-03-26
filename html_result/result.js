var randomScalingFactor = function(){ return Math.round(Math.random()*1000)};
var pontuacao =  [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]; // altere cada uma das pontuacoes aki
var total = randomScalingFactor(); // altera a pontuacao final aki

var barChartData = {
	labels : ["Compile","Encryption","Browse","Compress","HD","Video","Image"],
	datasets : [
		{
            label: "Score",
			fillColor : "rgba(220,220,220,0.5)",
			strokeColor : "rgba(220,220,220,0.8)",
			highlightFill: "rgba(220,220,220,0.75)",
			highlightStroke: "rgba(220,220,220,1)",
			data : pontuacao
		},
	]

}
window.onload = function(){
    document.getElementsByTagName("h2")[0].innerHTML = "Final Score: "+total;
	var ctx = document.getElementById("barra").getContext("2d");
	window.myBar = new Chart(ctx).Bar(barChartData, {
		responsive : true
	});
}
