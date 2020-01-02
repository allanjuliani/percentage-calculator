package me.juliani.allan.percentage_calculator;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
// import android.widget.Toast;

import java.text.DecimalFormat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        final ImageView eraser1 = findViewById(R.id.eraserView1);
        final ImageView eraser2 = findViewById(R.id.eraserView2);
        final ImageView eraser3 = findViewById(R.id.eraserView3);

        final EditText input1 = findViewById(R.id.input1);
        final EditText input2 = findViewById(R.id.input2);
        final EditText input3 = findViewById(R.id.input3);

        eraser1.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                EditText input1 = findViewById(R.id.input1);
                input1.getText().clear();
                eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorSecondaryLight));
            }
        });

        eraser2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                EditText input2 = findViewById(R.id.input2);
                input2.getText().clear();
                eraser2.setColorFilter(eraser2.getContext().getResources().getColor(R.color.colorSecondaryLight));
            }
        });

        eraser3.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                EditText input3 = findViewById(R.id.input3);
                input3.getText().clear();
                eraser3.setColorFilter(eraser3.getContext().getResources().getColor(R.color.colorSecondaryLight));
            }
        });

        input1.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View view, int i, KeyEvent keyEvent) {
                String value1String = input1.getText().toString();

                if (value1String.isEmpty()) {
                    eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorSecondaryLight));

                } else {
                    eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorPrimary));
                }
                return false;
            }
        });

        input2.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View view, int i, KeyEvent keyEvent) {
                String value2String = input2.getText().toString();

                if (value2String.isEmpty()) {
                    eraser2.setColorFilter(eraser2.getContext().getResources().getColor(R.color.colorSecondaryLight));

                } else {
                    eraser2.setColorFilter(eraser2.getContext().getResources().getColor(R.color.colorPrimary));
                }
                return false;
            }
        });

        input3.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View view, int i, KeyEvent keyEvent) {
                String value3String = input3.getText().toString();

                if (value3String.isEmpty()) {
                    eraser3.setColorFilter(eraser3.getContext().getResources().getColor(R.color.colorSecondaryLight));

                } else {
                    eraser3.setColorFilter(eraser3.getContext().getResources().getColor(R.color.colorPrimary));
                }
                return false;
            }
        });

        // eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorAccent));
    }

    /** Called when the user taps the Send button */
    public void sendMessage(View view) {
        String message = getResources().getString(R.string.initial_message);
        // String message = "";
        String result;
        TextView textView = findViewById(R.id.textView);

        final ImageView eraser1 = findViewById(R.id.eraserView1);
        final ImageView eraser2 = findViewById(R.id.eraserView2);
        final ImageView eraser3 = findViewById(R.id.eraserView3);

        EditText input1 = findViewById(R.id.input1);
        EditText input2 = findViewById(R.id.input2);
        EditText input3 = findViewById(R.id.input3);

        String value1String = input1.getText().toString();
        String value2String = input2.getText().toString();
        String value3String = input3.getText().toString();

        String format = "###0.##";
        DecimalFormat formatted = new DecimalFormat(format);

        if (value1String.isEmpty() & !value2String.isEmpty() & !value3String.isEmpty()) {
            Double value2Double = Double.parseDouble(value2String);
            Double value3Double = Double.parseDouble(value3String);
            double math = (value2Double*value3Double)/100;
            result = formatted.format(math);
            message = String.format(getString(R.string.result), result, value2String, value3String);
            input1.setText(result);

            eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorPrimary));
            eraser2.setColorFilter(eraser2.getContext().getResources().getColor(R.color.colorPrimary));
            eraser3.setColorFilter(eraser3.getContext().getResources().getColor(R.color.colorPrimary));

        } else if (value2String.isEmpty() & !value1String.isEmpty() & !value3String.isEmpty()) {
            Double value1Double = Double.parseDouble(value1String);
            Double value3Double = Double.parseDouble(value3String);
            double math = (value1Double/value3Double)*100;
            result = formatted.format(math);
            message = String.format("%s is %s percent of %s",value1String, result, value3String);
            input2.setText(result);

            eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorPrimary));
            eraser2.setColorFilter(eraser2.getContext().getResources().getColor(R.color.colorPrimary));
            eraser3.setColorFilter(eraser3.getContext().getResources().getColor(R.color.colorPrimary));

        } else if (value3String.isEmpty() & !value1String.isEmpty() & !value2String.isEmpty()) {
            Double value1Double = Double.parseDouble(value1String);
            Double value2Double = Double.parseDouble(value2String);
            // eraser2.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorAccent));
            double math = (value1Double / value2Double) * 100;
            result = formatted.format(math);
            message = String.format("%s is %s percent of %s",value1String, value2Double, result);
            input3.setText(result);

            eraser1.setColorFilter(eraser1.getContext().getResources().getColor(R.color.colorPrimary));
            eraser2.setColorFilter(eraser2.getContext().getResources().getColor(R.color.colorPrimary));
            eraser3.setColorFilter(eraser3.getContext().getResources().getColor(R.color.colorPrimary));

        }
        // else {
        // input3.setError("");
        // Toast.makeText(MainActivity.this, getString(R.string.initial_message), Toast.LENGTH_SHORT).show();
        //}

        textView.setText(message);
    }
}
